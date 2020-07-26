<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Carrito
 * 
 * @property int $idCarrito
 * @property int $idUsuario
 * @property int $idItem
 * @property int $idMoneda
 * @property float $cantidad
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Item $item
 * @property Moneda $moneda
 * @property Usuario $usuario
 *
 * @package App\Models
 */
class Carrito extends Model
{
	protected $table = 'carrito';
	protected $primaryKey = 'idCarrito';
	public $timestamps = false;

	protected $casts = [
		'idUsuario' => 'int',
		'idItem' => 'int',
		'idMoneda' => 'int',
		'cantidad' => 'float',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'idUsuario',
		'idItem',
		'idMoneda',
		'cantidad',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function item()
	{
		return $this->belongsTo(Item::class, 'idItem');
	}

	public function moneda()
	{
		return $this->belongsTo(Moneda::class, 'idMoneda');
	}

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'idUsuario');
	}
}
