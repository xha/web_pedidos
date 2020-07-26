<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Estado
 * 
 * @property int $idEstado
 * @property string $descripcion
 * @property int $idPais
 * @property Carbon $fechaCreacion
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Pais $pais
 * @property Collection|Municipio[] $municipios
 *
 * @package App\Models
 */
class Estado extends Model
{
	protected $table = 'estado';
	protected $primaryKey = 'idEstado';
	public $timestamps = false;

	protected $casts = [
		'idPais' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'descripcion',
		'idPais',
		'fechaCreacion',
		'estado',
		'activo'
	];

	public function pais()
	{
		return $this->belongsTo(Pais::class, 'idPais');
	}

	public function municipios()
	{
		return $this->hasMany(Municipio::class, 'idEstado');
	}
}
