<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class ItemExistencia
 * 
 * @property int $idItemExistencia
 * @property int $idUbicacion
 * @property int $idItem
 * @property float|null $existencia
 * @property float|null $cantidadPendiente
 * @property float|null $cantidadComprometida
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Item $item
 * @property Ubicacion $ubicacion
 *
 * @package App\Models
 */
class ItemExistencia extends Model
{
	protected $table = 'item_existencia';
	protected $primaryKey = 'idItemExistencia';
	public $timestamps = false;

	protected $casts = [
		'idUbicacion' => 'int',
		'idItem' => 'int',
		'existencia' => 'float',
		'cantidadPendiente' => 'float',
		'cantidadComprometida' => 'float',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'idUbicacion',
		'idItem',
		'existencia',
		'cantidadPendiente',
		'cantidadComprometida',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function item()
	{
		return $this->belongsTo(Item::class, 'idItem');
	}

	public function ubicacion()
	{
		return $this->belongsTo(Ubicacion::class, 'idUbicacion');
	}
}
