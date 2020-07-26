<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class UnidadMedida
 * 
 * @property int $idUnidadMedida
 * @property string $descripcion
 * @property string $abreviatura
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Collection|Item[] $items
 *
 * @package App\Models
 */
class UnidadMedida extends Model
{
	protected $table = 'unidad_medida';
	protected $primaryKey = 'idUnidadMedida';
	public $timestamps = false;

	protected $casts = [
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'descripcion',
		'abreviatura',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function items()
	{
		return $this->hasMany(Item::class, 'idUnidadMedida');
	}
}
